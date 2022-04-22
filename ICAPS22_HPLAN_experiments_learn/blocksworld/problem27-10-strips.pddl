( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b115 - block
    b777 - block
    b856 - block
    b985 - block
    b129 - block
    b738 - block
    b361 - block
    b969 - block
    b499 - block
    b492 - block
    b808 - block
    b50 - block
    b415 - block
    b353 - block
    b804 - block
    b874 - block
    b846 - block
    b709 - block
    b347 - block
    b787 - block
    b532 - block
    b595 - block
    b500 - block
    b812 - block
    b23 - block
    b104 - block
    b43 - block
    b916 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b115 )
    ( on b777 b115 )
    ( on b856 b777 )
    ( on b985 b856 )
    ( on b129 b985 )
    ( on b738 b129 )
    ( on b361 b738 )
    ( on b969 b361 )
    ( on b499 b969 )
    ( on b492 b499 )
    ( on b808 b492 )
    ( on b50 b808 )
    ( on b415 b50 )
    ( on b353 b415 )
    ( on b804 b353 )
    ( on b874 b804 )
    ( on b846 b874 )
    ( on b709 b846 )
    ( on b347 b709 )
    ( on b787 b347 )
    ( on b532 b787 )
    ( on b595 b532 )
    ( on b500 b595 )
    ( on b812 b500 )
    ( on b23 b812 )
    ( on b104 b23 )
    ( on b43 b104 )
    ( on b916 b43 )
    ( clear b916 )
  )
  ( :goal
    ( and
      ( clear b115 )
    )
  )
)
