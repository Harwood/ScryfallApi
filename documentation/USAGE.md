# Table of contents

<!--ts-->
* [Sending requests](#sending-requests)
* [Adding new operations](#adding-new-operations)
* [API reference](#api-reference)
    * [AutocompleteCardName](#autocompletecardname)
    * [GetAllBulkData](#getallbulkdata)
    * [GetAllCardSymbols](#getallcardsymbols)
    * [GetAllSets](#getallsets)
    * [GetBulkData](#getbulkdata)
    * [GetCard](#getcard)
    * [GetCardCollection](#getcardcollection)
    * [GetCatalog](#getcatalog)
    * [GetRandomCard](#getrandomcard)
    * [GetRulings](#getrulings)
    * [GetSet](#getset)
    * [ParseManaCost](#parsemanacost)
    * [SearchCard](#searchCards)
<!--te-->

#  Sending requests

### Sending a single request

```swift
let scryfall = Scryfall()
let request = ScryfallRequest(operation: ScryfallApi.AutocompleteCardName(candidate: "llanowar el"))

do {
    let response = try await scryfall.send(request: request)
} catch {
    print("Scryfall returned an error: \(error)")
}
```

### Sending multiple requests

```swift
let scryfall = Scryfall()
let cardRequest1 = ScryfallRequest(operation: ScryfallApi.GetCard(exactName: "Maelstrom Wanderer"))
let cardRequest2 = ScryfallRequest(operation: ScryfallApi.GetCard(exactName: "Llanowar Elves"))
let cardRequest3 = ScryfallRequest(operation: ScryfallApi.GetCard(exactName: "Seton, Krosan Protector"))
let requests = [cardRequest1, cardRequest2, cardRequest3]

do {
    let responses = try await scryfall.send(requests: requests)
} catch {
    print("Scryfall returned an error: \(error)")
}
```

# Adding new operations

ScryfallApi provides pre-built operations for all Scryfall endpoints out-of-the-box. 

However, adding a new operation is simple. Your operation object/type just needs to implement [`ScryfallOperation`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/ScryfallOperation.swift). Note that the ScryfallApi adds all operation and response types to the public `ScryfallApi` namespace - this is not required.

### [`ScryfallOperation`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/ScryfallOperation.swift)
- `path`: The path component for the underlying `URLRequest`.
- `urlQueryItems`: Build the query component for the underlying `URLRequest`.
- `httpMethod`: Populate the http method, headers, and body for the underlying `URLRequest`.
- `Response`: Every operation must specify a `Codable` response that it expects to receive from the Scryfall API.

```swift
extension ScryfallApi {
    struct ExampleOperation: ScryfallOperation {
        typealias Response = ExampleResponse
        let path: String = "/some/path"
        let urlQueryItems: [URLQueryItem] = []
        let httpMethod: HTTPMethod = .GET
    }

    struct ExampleResponse: Equatable, Codable {
        let value1: String
        let value2: String
        ...
        let valueN: String
    }
}
```

# API reference

## [`AutocompleteCardName`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/AutocompleteCardName.swift)
Query for a catalog of up to 20 full english card names that could be autocompletions of the candidate string. [See full Scryfall documentation](https://scryfall.com/docs/api/cards/autocomplete).

- Parameter `candidate`: The candidate string to autocomplete.
- Parameter `includeExtras`: If true, extra cards (tokens, planes, vanguards, etc) will be included.
```swift
let operation = ScryfallApi.AutocompleteCardName(
    candidate: "llanowar el", 
    includeExtras: true
)
```

## [`GetAllBulkData`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetAllBulkData.swift)

Query for a page containing all bulk data on Scryfall. This operation does not accept any additional parameters. [See full Scryfall documentation](https://scryfall.com/docs/api/bulk-data/all).

```swift
let operation = ScryfallApi.GetAllBulkData()
```

## [`GetAllCardSymbols`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetAllCardSymbols.swift)

Query for a page containing all card symbols on Scryfall. This operation does not accept any additional parameters. [See full Scryfall documentation](https://scryfall.com/docs/api/card-symbols/all).

```swift
let operation = ScryfallApi.GetAllCardSymbols()
```

## [`GetAllSets`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetAllSets.swift)

Query for a page containing all sets on Scryfall. This operation does not accept any additional parameters. [See full Scryfall documentation](https://scryfall.com/docs/api/sets/all).

```swift
let operation = ScryfallApi.GetAllSets()
```

## [`GetBulkData`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetBulkData.swift)

Query for bulk data. [See full Scryfall documentation](https://scryfall.com/docs/api/bulk-data).

- Parameter `id`: The unique ID of the bulk data. Valid bulk data IDs can be retrieved from executing the [GetAllBulkData](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetAllBulkData.swift) operation.
```swift
let operation = ScryfallApi.GetBulkData(id: "922288cb-4bef-45e1-bb30-0c2bd3d3534f")
```

- Parameter `type`: The bulk data type to query. Valid bulk data types can be retrieved from executing the [GetAllBulkData](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetAllBulkData.swift) operation.
```swift
let operation = ScryfallApi.GetBulkData(type: "all_cards")
```

## [`GetCard`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetCard.swift)

Query for a single card. [See full Scryfall documentation](https://scryfall.com/docs/api/cards).

- Parameter `identifier`: The card's unique identifier, from a list of valid lookup identifiers supported by the Scryfall API.
```swift
let uuid = UUID(uuidString: "9129baf5-ffa9-4ffb-bcab-19d6a42dbfcc")
let operation = ScryfallApi.GetCard(identifier: .scryfall(uuid))
```

- Parameter `setCode`: A unique three to five-letter set code to limit the search to one set.
- Parameter `collectorNumber`: The card's collector number.
- Parameter `language`: An optional 2-3 character language code.
```swift
let operation = ScryfallApi.GetCard(
    setCode: "pc2",
    collectorNumber: "101",
    language: "en"
)
```

- Parameter `exactName`: An exact card name to search for.
- Parameter `setCode`: A unique three to five-letter set code to limit the search to one set. If a set code is not provided, the newest edition of the card will be returned.
```swift
let operation = ScryfallApi.GetCard(
    exactName: "Maelstrom Wanderer",
    setCode: "pc2"
)
```

- Parameter `fuzzyName`: A fuzzy card name to search for.
- Parameter `setCode`: A unique three to five-letter set code to limit the search to one set. If a set code is not provided, the newest edition of the card will be returned.
```swift
let operation = ScryfallApi.GetCard(
    fuzzyName: "MaElStr0m WaNderror",
    setCode: "pc2"
)
```

## [`GetCardCollection`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetCardCollection.swift)

Query for page of cards with specific identifiers. [See full Scryfall documentation](https://scryfall.com/docs/api/cards/collection).

Each submitted card identifier must be a JSON object with one or more valid identifier schema combinations. Multiple identifier schemas may be included in a single operation. Each identifier will return up to one card.

Each POST to "/cards/collection" must contain *at most* 75 identifiers. If you have `75 > n <= Int.max` identifiers, group them into `ceiling(n / 75)` operations and send them using `send<T: ScryfallOperation>(requests: [ScryfallRequest<T>]) async throws -> [ScryfallResult<T>]`.

- Parameter `input`: Contains a list of valid identifiers for an operation.
```swift
let identifiers: [ScryfallApi.GetCardCollection.Input.Identifier] = [
    .scryfall(UUID(uuidString: "9129baf5-ffa9-4ffb-bcab-19d6a42dbfcc")!),
    .mtgo(45062),
    .multiverse(265154),
    .oracle(UUID(uuidString: "ad9b7fbc-61c8-43ee-a65c-99206fd1e4df")!),
    .illustration(UUID(uuidString: "05580cef-2d91-4c75-9a58-fbd39a545303")!),
    .name("Maelstrom Wanderer"),
    .nameSetCode(name: "Maelstrom Wanderer", setCode: "pc2"),
    .collectorNumberSetCode(collectorNumber: "101", setCode: "pc2")
]
let operation = ScryfallApi.GetCardCollection(input: .init(identifiers: identifiers))
```

## [`GetCatalog`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetCatalog.swift)

Query for a single catalog which contains an array of Magic datapoints (words, card values, etc). Values are updated as soon as a new card is entered for spoiler seasons. [See full Scryfall documentation](https://scryfall.com/docs/api/catalogs).

- Parameter `catalogName`: The name of the catalog to query for.
```swift
let operation = ScryfallApi.GetCatalog(named: .cardNames)
```

## [`GetRandomCard`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetRandomCard.swift)

Query for a single random card. The random card pool can be filtered. [See full Scryfall documentation](https://scryfall.com/docs/api/cards/random).

- Parameter `filter`: An optional fulltext entry to filter the pool of random cards.
```swift
let operation = ScryfallApi.GetRandomCard(filter: "llanowar")
```

## [`GetRulings`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetRulings.swift)

Query for a page of rulings for a specific card. [See full Scryfall documentation](https://scryfall.com/docs/api/rulings).

- Parameter `identifier`: The card's unique identifier, from a list of valid lookup identifiers supported by the Scryfall API.
```swift
let uuid = UUID(uuidString: "9129baf5-ffa9-4ffb-bcab-19d6a42dbfcc")
let operation = ScryfallApi.GetRulings(identifier: .scryfall(uuid))
```

- Parameter `setCode`: The card's unique three to five-letter set code.
- Parameter `collectorNumber`: The card's collector number.
```swift
let operation = ScryfallApi.GetRulings(
    setCode: "pc2",
    collectorNumber: "101"
)
```

## [`GetSet`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/GetSet.swift)

Query for a single set. [See full Scryfall documentation](https://scryfall.com/docs/api/sets).

- Parameter `identifier`: The set's unique identifier, from a list of valid lookup identifiers supported by the Scryfall API.
```swift
let uuid = UUID(uuidString: "9129baf5-ffa9-4ffb-bcab-19d6a42dbfcc")
let operation = ScryfallApi.GetSet(identifier: .scryfall(uuid))
```

- Parameter `setCode`: The unique three to five-letter code for this set.
```swift
let operation = ScryfallApi.GetSet(setCode: "pc2")
```

## [`ParseManaCost`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/ParseManaCost.swift)

Parse the given mana cost and returns Scryfall???s interpretation. The server understands most community shorthand for mana costs. Symbols can also be out of order, lowercase, or have multiple colorless costs. [See full Scryfall documentation](https://scryfall.com/docs/api/card-symbols/parse-mana).

- Parameter `manaCost`: The mana cost string to parse.
```swift
let operation = ScryfallApi.ParseManaCost(manaCost: "8{U}{R}")
```

## [`SearchCards`](https://github.com/GauntletApp/ScryfallApi/blob/main/Sources/ScryfallApi/Operations/SearchCards.swift)

Query for a paginated list of cards based on the given search term. [See full Scryfall documentation](https://scryfall.com/docs/api/cards/search).

- Parameter `searchTerm`: A fulltext search query with a maximum of 1000 Unicode characters.
- Parameter `orderedBy`: The method to order the cards.
- Parameter `direction`: The direction to sort the ordered cards.
- Parameter `uniquedBy`: The strategy for omitting similar cards.
- Parameter `page`: The page number to return.
- Parameter `includeExtras`: If true, extra cards (tokens, planes, etc) will be included.
- Parameter `includeMultilingual`: If true, cards in every language supported by Scryfall will be included.
- Parameter `includeVariations`: If true, rare care variants will be included.
```swift
let operation = ScryfallApi.SearchCards(
    searchTerm: "llanowar",
    orderedBy: .name,
    direction: .auto,
    uniquedBy: .cards,
    page: 1,
    includeExtras: true,
    includeMultilingual: true,
    includeVariations: true
)
```
