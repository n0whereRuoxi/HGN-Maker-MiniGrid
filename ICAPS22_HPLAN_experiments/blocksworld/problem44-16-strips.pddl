( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b389 - block
    b161 - block
    b909 - block
    b602 - block
    b13 - block
    b441 - block
    b155 - block
    b777 - block
    b499 - block
    b252 - block
    b489 - block
    b132 - block
    b714 - block
    b639 - block
    b717 - block
    b262 - block
    b452 - block
    b587 - block
    b429 - block
    b735 - block
    b589 - block
    b202 - block
    b110 - block
    b932 - block
    b269 - block
    b569 - block
    b354 - block
    b37 - block
    b152 - block
    b774 - block
    b423 - block
    b765 - block
    b336 - block
    b431 - block
    b273 - block
    b402 - block
    b451 - block
    b198 - block
    b254 - block
    b949 - block
    b49 - block
    b813 - block
    b978 - block
    b647 - block
    b23 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b389 )
    ( on b161 b389 )
    ( on b909 b161 )
    ( on b602 b909 )
    ( on b13 b602 )
    ( on b441 b13 )
    ( on b155 b441 )
    ( on b777 b155 )
    ( on b499 b777 )
    ( on b252 b499 )
    ( on b489 b252 )
    ( on b132 b489 )
    ( on b714 b132 )
    ( on b639 b714 )
    ( on b717 b639 )
    ( on b262 b717 )
    ( on b452 b262 )
    ( on b587 b452 )
    ( on b429 b587 )
    ( on b735 b429 )
    ( on b589 b735 )
    ( on b202 b589 )
    ( on b110 b202 )
    ( on b932 b110 )
    ( on b269 b932 )
    ( on b569 b269 )
    ( on b354 b569 )
    ( on b37 b354 )
    ( on b152 b37 )
    ( on b774 b152 )
    ( on b423 b774 )
    ( on b765 b423 )
    ( on b336 b765 )
    ( on b431 b336 )
    ( on b273 b431 )
    ( on b402 b273 )
    ( on b451 b402 )
    ( on b198 b451 )
    ( on b254 b198 )
    ( on b949 b254 )
    ( on b49 b949 )
    ( on b813 b49 )
    ( on b978 b813 )
    ( on b647 b978 )
    ( on b23 b647 )
    ( clear b23 )
  )
  ( :goal
    ( and
      ( clear b389 )
    )
  )
)
