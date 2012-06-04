include_recipe "build-essential"
include_recipe "java"
include_recipe "zeromq"

jzmq_tar_gz = File.join(Chef::Config[:file_cache_path], "/", "jzmq.tar.gz")

remote_file jzmq_tar_gz do
  source node[:jzmq][:src_mirror]
end

bash "install jzmq" do
  cwd Chef::Config[:file_cache_path]
  # the rm/mv part is ugly, but can't be helped because the tarball
  # from github trunk always has a zeromq-jzmq-COMMITHASH folder in it
  code <<-EOH
    rm -r zeromq-jzmq*
    tar -zxf #{jzmq_tar_gz}
    mv zeromq-jzmq* jzmq
    cd jzmq && ./configure --prefix=#{node[:jzmq][:install_dir]} --with-zeromq=#{node[:jzmq][:zeromq_install_dir]} && make && make install
  EOH
  not_if { ::FileTest.exists?("#{node[:jzmq][:install_dir]}/lib/libjzmq.so") }
  not_if { ::FileTest.exists?("#{node[:jzmq][:install_dir]}/share/zmq.jar") }
end

if node[:platform] == "debian"
  execute "add jzmq to shared libs" do
    command "echo \"#{node[:jzmq][:install_dir]}/lib/\" > /etc/ld.so.conf.d/jzmq.conf"
    creates "/etc/ld.so.conf.d/jzmq.conf"
    action :run
  end
  
  execute "run ldconfig" do
    command "ldconfig"
    action :run
  end
end
