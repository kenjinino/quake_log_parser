require 'spec_helper'

using StringHelpers

describe "String helpers" do

  it "#is_initgame?" do
    "InitGame".is_initgame?.should be_true
  end

  it "#is_clientuserinfochanged?" do
    "ClientUserinfoChanged".is_clientuserinfochanged?.should be_true
  end

  it "#is_kill?" do
    "Kill".is_kill?.should be_true
  end

  it "#clientuserinfochanged" do
    clientuserinfo = '  3:32 ClientUserinfoChanged: 5 n\Dono da Bola\t\0\model\sarge\hmodel\sarge\g_redteam\\g_blueteam\\c1\4\c2\5\hc\95\w\0\l\0\tt\0\tl\0'.clientuserinfochanged
    clientuserinfo[:player_id].to_i.should eql(5)
    clientuserinfo[:player_name].should eql("Isgalamido")
  end

  it "#kill" do
    kill_info = '  2:10 Kill: 4 7 10: Zeh killed Assasinu Credi by MOD_RAILGUN'.kill
    kill_info[:killer_id].to_i.should eql(4)
    kill_info[:killed_id].to_i.should eql(7)
    kill_info[:mean_of_death_id].to_i.should eql(10)
  end
end

