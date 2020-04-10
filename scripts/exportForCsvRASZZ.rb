require 'csv'
require 'pg'
require 'json'

project_name = ARGV[0]

#bfc equivale ao fix revision
#bic equivale ao revision
#{{{ persist_bugfixes(project_csv)
def persist_bugfixes(project_name)
    p 'entering the persist_bugfixes() method'

    # file = File.read(project_json)
    # data = JSON.parse(file)

  begin
    con = PG.connect :dbname => 'raszz-fineract', :user => 'postgres', :password => 'postgres'
    p 'connection established'

    # count = 0;
    # size = data.size()

    # p "inserting issuecode: #{issuecode}, revisionnumber: #{revisionnumber}, commitdate: #{commitdate}, issuetype: #{issuetype}, project_name: #{project_name}"
    query = "SELECT revision, fixrevision, project FROM bicraszzgit  WHERE project = '#{project_name}';"
    responseQuery = con.exec(query)
    CSV.open("szz_out.csv", "w") do |csv|
      csv << ["bfc", "bic", "name"]
      responseQuery.each do | a |
        p(a["project"])
        p a["revision"]
        p a["fixrevision"]
        csv << [a["fixrevision"], a["revision"], a["project"]]
      end
    end
    p "finish!"
  rescue PG::Error => e
    p e.message
  ensure
    con.close
  end
end
#}}}

persist_bugfixes(project_name)
