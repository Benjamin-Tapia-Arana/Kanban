# lib/tasks/remove_tu_linker_duplicates.rake

namespace :db do
    desc "Remove duplicate tu_linkers based on team_id and user_id"
    task remove_tu_linker_duplicates: :environment do

      duplicates = TuLinker.select(:team_id, :user_id)
                           .group(:team_id, :user_id)
                           .having('COUNT(*) > 1')
  

      duplicates.each do |duplicate|
        tu_linkers = TuLinker.where(team_id: duplicate.team_id, user_id: duplicate.user_id).to_a
        tu_linkers.shift
        tu_linkers.each(&:destroy)
      end
  
      puts "Usuarios duplicados en el equipo eliminados."
    end
  end
  