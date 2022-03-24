( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b497 - block
    b505 - block
    b65 - block
    b798 - block
    b763 - block
    b656 - block
    b720 - block
    b456 - block
    b577 - block
    b683 - block
    b805 - block
    b806 - block
    b421 - block
    b60 - block
    b630 - block
    b879 - block
    b470 - block
    b241 - block
    b373 - block
    b657 - block
    b85 - block
    b193 - block
    b319 - block
    b910 - block
    b818 - block
    b812 - block
    b904 - block
    b828 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b497 )
    ( on b505 b497 )
    ( on b65 b505 )
    ( on b798 b65 )
    ( on b763 b798 )
    ( on b656 b763 )
    ( on b720 b656 )
    ( on b456 b720 )
    ( on b577 b456 )
    ( on b683 b577 )
    ( on b805 b683 )
    ( on b806 b805 )
    ( on b421 b806 )
    ( on b60 b421 )
    ( on b630 b60 )
    ( on b879 b630 )
    ( on b470 b879 )
    ( on b241 b470 )
    ( on b373 b241 )
    ( on b657 b373 )
    ( on b85 b657 )
    ( on b193 b85 )
    ( on b319 b193 )
    ( on b910 b319 )
    ( on b818 b910 )
    ( on b812 b818 )
    ( on b904 b812 )
    ( on b828 b904 )
    ( clear b828 )
  )
  ( :tasks
    ( Make-27Pile b505 b65 b798 b763 b656 b720 b456 b577 b683 b805 b806 b421 b60 b630 b879 b470 b241 b373 b657 b85 b193 b319 b910 b818 b812 b904 b828 )
  )
)
