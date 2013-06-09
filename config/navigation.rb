SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :report, 'Report', '/mobile/report'
    primary.item :respond,'Respond', '/mobile/respond'
  end
end
