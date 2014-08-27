module Rubydoro
  module Daemon
    module_function  

    @@pidfile = File.expand_path('../../../pid/rubydoro.pid', __FILE__)

    def run(&block)
      Process.daemon
      create_pid
      block.call
      remove_pid
    end

    def stop
      pid = read_pid
      File.open(File.expand_path('../../../log/rubydoro.status', __FILE__), 'w') { |f| f.write '---' }
      %x{rm -f #{@@pidfile} && kill #{pid}}
      exit $?.exitstatus
    end

    def running?
      File.exist? @@pidfile
    end

    def create_pid
      File.open(@@pidfile, 'w') { |f| f.write Process.pid }
    end

    def read_pid
      File.read(@@pidfile) rescue nil
    end

    def remove_pid
      %x{rm -f #{@@pidfile}}
    end

  end
 end
