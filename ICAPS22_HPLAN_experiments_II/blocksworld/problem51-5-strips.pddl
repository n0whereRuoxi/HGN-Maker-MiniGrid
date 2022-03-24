( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b547 - block
    b602 - block
    b52 - block
    b835 - block
    b54 - block
    b203 - block
    b800 - block
    b924 - block
    b321 - block
    b212 - block
    b295 - block
    b345 - block
    b6 - block
    b23 - block
    b55 - block
    b233 - block
    b164 - block
    b606 - block
    b136 - block
    b574 - block
    b285 - block
    b972 - block
    b273 - block
    b41 - block
    b703 - block
    b441 - block
    b431 - block
    b90 - block
    b205 - block
    b322 - block
    b228 - block
    b244 - block
    b635 - block
    b241 - block
    b336 - block
    b978 - block
    b771 - block
    b541 - block
    b629 - block
    b38 - block
    b848 - block
    b473 - block
    b993 - block
    b587 - block
    b169 - block
    b826 - block
    b668 - block
    b966 - block
    b581 - block
    b390 - block
    b888 - block
    b630 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b547 )
    ( on b602 b547 )
    ( on b52 b602 )
    ( on b835 b52 )
    ( on b54 b835 )
    ( on b203 b54 )
    ( on b800 b203 )
    ( on b924 b800 )
    ( on b321 b924 )
    ( on b212 b321 )
    ( on b295 b212 )
    ( on b345 b295 )
    ( on b6 b345 )
    ( on b23 b6 )
    ( on b55 b23 )
    ( on b233 b55 )
    ( on b164 b233 )
    ( on b606 b164 )
    ( on b136 b606 )
    ( on b574 b136 )
    ( on b285 b574 )
    ( on b972 b285 )
    ( on b273 b972 )
    ( on b41 b273 )
    ( on b703 b41 )
    ( on b441 b703 )
    ( on b431 b441 )
    ( on b90 b431 )
    ( on b205 b90 )
    ( on b322 b205 )
    ( on b228 b322 )
    ( on b244 b228 )
    ( on b635 b244 )
    ( on b241 b635 )
    ( on b336 b241 )
    ( on b978 b336 )
    ( on b771 b978 )
    ( on b541 b771 )
    ( on b629 b541 )
    ( on b38 b629 )
    ( on b848 b38 )
    ( on b473 b848 )
    ( on b993 b473 )
    ( on b587 b993 )
    ( on b169 b587 )
    ( on b826 b169 )
    ( on b668 b826 )
    ( on b966 b668 )
    ( on b581 b966 )
    ( on b390 b581 )
    ( on b888 b390 )
    ( on b630 b888 )
    ( clear b630 )
  )
  ( :goal
    ( and
      ( clear b547 )
    )
  )
)
