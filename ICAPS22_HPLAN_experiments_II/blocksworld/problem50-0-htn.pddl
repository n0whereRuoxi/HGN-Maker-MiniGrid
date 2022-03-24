( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b55 - block
    b110 - block
    b329 - block
    b892 - block
    b949 - block
    b231 - block
    b568 - block
    b564 - block
    b904 - block
    b637 - block
    b940 - block
    b297 - block
    b769 - block
    b456 - block
    b94 - block
    b870 - block
    b366 - block
    b864 - block
    b872 - block
    b624 - block
    b475 - block
    b519 - block
    b425 - block
    b757 - block
    b341 - block
    b717 - block
    b28 - block
    b304 - block
    b313 - block
    b417 - block
    b68 - block
    b646 - block
    b502 - block
    b305 - block
    b487 - block
    b914 - block
    b424 - block
    b930 - block
    b970 - block
    b283 - block
    b132 - block
    b775 - block
    b762 - block
    b890 - block
    b630 - block
    b358 - block
    b807 - block
    b545 - block
    b547 - block
    b83 - block
    b300 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b55 )
    ( on b110 b55 )
    ( on b329 b110 )
    ( on b892 b329 )
    ( on b949 b892 )
    ( on b231 b949 )
    ( on b568 b231 )
    ( on b564 b568 )
    ( on b904 b564 )
    ( on b637 b904 )
    ( on b940 b637 )
    ( on b297 b940 )
    ( on b769 b297 )
    ( on b456 b769 )
    ( on b94 b456 )
    ( on b870 b94 )
    ( on b366 b870 )
    ( on b864 b366 )
    ( on b872 b864 )
    ( on b624 b872 )
    ( on b475 b624 )
    ( on b519 b475 )
    ( on b425 b519 )
    ( on b757 b425 )
    ( on b341 b757 )
    ( on b717 b341 )
    ( on b28 b717 )
    ( on b304 b28 )
    ( on b313 b304 )
    ( on b417 b313 )
    ( on b68 b417 )
    ( on b646 b68 )
    ( on b502 b646 )
    ( on b305 b502 )
    ( on b487 b305 )
    ( on b914 b487 )
    ( on b424 b914 )
    ( on b930 b424 )
    ( on b970 b930 )
    ( on b283 b970 )
    ( on b132 b283 )
    ( on b775 b132 )
    ( on b762 b775 )
    ( on b890 b762 )
    ( on b630 b890 )
    ( on b358 b630 )
    ( on b807 b358 )
    ( on b545 b807 )
    ( on b547 b545 )
    ( on b83 b547 )
    ( on b300 b83 )
    ( clear b300 )
  )
  ( :tasks
    ( Make-50Pile b110 b329 b892 b949 b231 b568 b564 b904 b637 b940 b297 b769 b456 b94 b870 b366 b864 b872 b624 b475 b519 b425 b757 b341 b717 b28 b304 b313 b417 b68 b646 b502 b305 b487 b914 b424 b930 b970 b283 b132 b775 b762 b890 b630 b358 b807 b545 b547 b83 b300 )
  )
)
