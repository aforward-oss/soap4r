namespace :ci do

  desc "Build the project"
  task :build do
    begin
      Rake::Task['ci:success'].invoke
    rescue Exception => e
      Rake::Task['ci:failure'].invoke
      raise e
    end
  end
  
  desc "The Build Succeeded, so tell our monitoring service"
  task :success do
    if File.exists?("/home/deployer/monitor/log")
      system 'echo "Soap5r succeeded, http://cc.cenx.localnet" > /home/deployer/monitor/log/Soap5r.cc'
    else
      print "BUILD SUCCEEDED, but log directory (/home/deployer/monitor/log) does not exist"
    end
  end

  desc "The Build failed, so tell our monitoring service"
  task :failure do
    if File.exists?("/home/deployer/monitor/log")
      system "curl http://cc.cenx.localnet/soap5r > /home/deployer/monitor/log/Soap5r.cc"
    else
      raise "BUILD FAILED, but log directory (/home/deployer/monitor/log) does not exist"
    end
  end
  
end
