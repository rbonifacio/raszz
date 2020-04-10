require 'csv'
require 'pg'
require 'json'

project_name = ARGV[0]
project_json = ARGV[1]


#{{{ persist_bugfixes(project_csv)
def persist_bugfixes(project_name, project_json)
    p 'entering the persist_bugfixes() method'

    file = File.read(project_json)
    data = JSON.parse(file)

  begin
    con = PG.connect :dbname => 'bszz', :user => 'postgres', :password => 'postgres'
    p 'connection established'

    count = 0;
    size = data.size()

    data.each do |key, value|
        issuecode = key
        revisionnumber = value["hash"]
        commitdate = value["resolutiondate"]
        issuetype = 'Bug'
        p "inserting issuecode: #{issuecode}, revisionnumber: #{revisionnumber}, commitdate: #{commitdate}, issuetype: #{issuetype}, project_name: #{project_name}"
        query = "insert into linkedissuessvn (projectname, issuecode, revisionnumber, commitdate, issuetype) values ('#{project_name}', '#{issuecode}', '#{revisionnumber}', '#{commitdate}', '#{issuetype}');"
        con.exec query
        count += 1
        p "inserted #{count} of #{size}"
    end
  rescue PG::Error => e
    p e.message
  ensure
    con.close
  end
end
#}}}

persist_bugfixes(project_name, project_json)
