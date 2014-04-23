module Filesystem
  
  def self.initdir
    require 'fileutils' 
    devcomp1 = "/home/ernie/workspaces/filesystem/"
    devcomp2 = "/home/ea/workspaces/filesystem/"
    devcomp3 = "C:/Users/ernesto/workspaces/filesystem/"
    devcomp4 = "/home/ees/workspaces/filesystem/"
    nhsrvts01 = "/home/ees/workspaces/filesystem/NHSRVTS01/"
    if File.directory?(devcomp1)
      initdir = devcomp1
    elsif File.directory?(devcomp2)
      initdir = devcomp2
    elsif File.directory?(devcomp3)
      initdir = devcomp3
    elsif File.directory?(nhsrvts01)
      initdir = nhsrvts01
    end
  end

end
