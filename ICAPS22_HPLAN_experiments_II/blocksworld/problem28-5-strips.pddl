( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b453 - block
    b97 - block
    b21 - block
    b871 - block
    b763 - block
    b153 - block
    b543 - block
    b865 - block
    b131 - block
    b368 - block
    b429 - block
    b196 - block
    b334 - block
    b396 - block
    b900 - block
    b95 - block
    b586 - block
    b923 - block
    b810 - block
    b3 - block
    b832 - block
    b549 - block
    b712 - block
    b836 - block
    b621 - block
    b511 - block
    b87 - block
    b934 - block
    b346 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b453 )
    ( on b97 b453 )
    ( on b21 b97 )
    ( on b871 b21 )
    ( on b763 b871 )
    ( on b153 b763 )
    ( on b543 b153 )
    ( on b865 b543 )
    ( on b131 b865 )
    ( on b368 b131 )
    ( on b429 b368 )
    ( on b196 b429 )
    ( on b334 b196 )
    ( on b396 b334 )
    ( on b900 b396 )
    ( on b95 b900 )
    ( on b586 b95 )
    ( on b923 b586 )
    ( on b810 b923 )
    ( on b3 b810 )
    ( on b832 b3 )
    ( on b549 b832 )
    ( on b712 b549 )
    ( on b836 b712 )
    ( on b621 b836 )
    ( on b511 b621 )
    ( on b87 b511 )
    ( on b934 b87 )
    ( on b346 b934 )
    ( clear b346 )
  )
  ( :goal
    ( and
      ( clear b453 )
    )
  )
)
