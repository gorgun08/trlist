statsviewer = Stats Viewer
    .rank = Türklist rank
    .score = Türklist score
    .stats = Türklist statları
    .hardest = En zor demon

    .completed = Geçilen demonlar
    .completed-main = Geçilen main list demonları
    .completed-extended = geçilen extended list demonları
    .completed-legacy = Geçilen legacy list demonları

    .created = Yapılan demonlar
    .published = Yayınlanan demonlar
    .verified = Verifylanan demonlar
    .progress = Progressler

    .stats-value = { $main } Main, { $extended } Extended, { $legacy } Legacy
    .value-none = Yok

statsviewer-individual = Individual
    .welcome = İncelemeye başlamak için soldan bir oyuncunun ismine tıklayın!

    .option-international = International

statsviewer-nation = Nations
    .welcome = Click on a country's name on the left to get started!

    .players = Players
    .unbeaten = Unbeaten demons

    .created-tooltip = (Co)created by { $players } { $players ->
            [one] player
            *[other] players
        } in this country:
    .published-tooltip = Published by:
    .verified-tooltip = Verified by:
    .beaten-tooltip = Beaten by { $players } { $players ->
            [one] player
            *[other] players
        } in this country:
    .progress-tooltip = Achieved by { $players } { $players ->
            [one] player
            *[other] players
        } in this country:

demon-sorting-panel = Demon Sorting
    .info = The order in which completed demons should be listed

    .option-alphabetical = Alphabetical
    .option-position = Position

continent-panel = Continent
    .info = Select a continent below to focus the stats viewer to that continent. Select 'All' to reset selection.

    .option-all = Tümü

    .option-asia = Asya
    .option-europe = Avrupa
    .option-australia = Avustralya
    .option-africa = Afrika
    .option-northamerica = Kuzey Amerika
    .option-southamerica = Güney Amerika
    .option-centralamerica = Orta Amerika

toggle-subdivision-panel = Show Subdivisions
    .info = Whether the map should display political subdivisions.

    .option-toggle = Show political subdivisions

# { $countries } will be replaced with .info-countries, which will be
# turned into a tooltip listing all of the selectable countries
subdivision-panel = Political Subdivision
    .info = For the { $countries } you can select a state/province from the dropdown below to focus the stats viewer to that state/province.
    .info-countries = following countries

    .option-none = None
