

require 'csv'
require 'pg'
require 'json'

project_name = ARGV[0]
project_json = ARGV[1]


#{{{ persist_bugfixes(project_csv)
def persist_bugfixes()
    p 'entering the persist_bugfixes() method'

    # file = File.read(project_json)
    # data = JSON.parse(file)
    listJson =  Dir["issues/*.json"].select{ |e| File.file? e }
    #print listJson[0]
    # Dir["issues/*.json" ].select{ |f| File.file? f }.map{ |f| File.basename f.partition("_").first }
    

    puts("Enter database name:")
    dataBaseName = gets
    puts("Enter the database user name:")
    userDataBaseName = gets
    puts("Enter the database user password:")
    passwordDataBase = gets

    begin
        # con = PG.connect :dbname => "#{dataBaseName.}", :user => "#{userDataBaseName}", :password => "#{passwordDataBase}"
        con = PG.connect :dbname => dataBaseName.delete!("\n"), :user => userDataBaseName.delete!("\n"), :password => passwordDataBase.delete!("\n")
        p 'connection established'

        puts("Enter folder name with issues")
        folder = gets

        files = Dir[folder.delete!("\n") + "/*.json" ].select{ |f| File.file? f }.map{ |f| File.basename f }
    
       
        files.each do |key, value|
            puts("[" + key.partition("_").first + "]")
            count = 0;
            file = File.read(folder + "/" + key)
            data = JSON.parse(file)
            size = data.size()
            data.each do |key, value|
                issuecode = key
                revisionnumber = value["hash"]
                commitdate = value["resolutiondate"]
                issuetype = 'Bug'
                p "inserting issuecode: #{issuecode}, revisionnumber: #{revisionnumber}, commitdate: #{commitdate}, issuetype: #{issuetype}, project_name: #{key.partition("_").first}"
                query = "insert into linkedissuessvn (projectname, issuecode, revisionnumber, commitdate, issuetype) values ('#{key.partition("_").first}', '#{issuecode}', '#{revisionnumber}', '#{commitdate}', '#{issuetype}');"
                con.exec query
                count += 1
                p "inserted #{count} of #{size}"
            end
            puts("[" + key.partition("_").first + "]" + " Completed")
        end
        
      rescue PG::Error => e
        p e.message
      ensure
        con.close
      end
end
#}}}

persist_bugfixes()
