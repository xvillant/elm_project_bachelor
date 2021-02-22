module Api.Article exposing (Article, decoder, listingDecoder)
import Api.Profile exposing (..)
import Json.Decode as D exposing (..)

type alias Article =
    { id : Int 
    , name : String
    , ingredients : List String
    , recipe : String
    , profile : Api.Profile.Profile
    }


decoder : Decoder Article
decoder =
    map5 Article
        (field "id" D.int)
        (field "name" D.string)
        (field "ingredients" (D.list D.string))
        (field "recipe" D.string)
        (field "profile" Api.Profile.decoder)


listingDecoder : Decoder (List Article)
listingDecoder =
    list decoder

