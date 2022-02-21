( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b544 - block
    b651 - block
    b233 - block
    b796 - block
    b121 - block
    b26 - block
    b828 - block
    b28 - block
    b536 - block
    b292 - block
    b961 - block
    b765 - block
    b221 - block
    b620 - block
    b396 - block
    b560 - block
    b485 - block
    b845 - block
    b343 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b544 )
    ( on b651 b544 )
    ( on b233 b651 )
    ( on b796 b233 )
    ( on b121 b796 )
    ( on b26 b121 )
    ( on b828 b26 )
    ( on b28 b828 )
    ( on b536 b28 )
    ( on b292 b536 )
    ( on b961 b292 )
    ( on b765 b961 )
    ( on b221 b765 )
    ( on b620 b221 )
    ( on b396 b620 )
    ( on b560 b396 )
    ( on b485 b560 )
    ( on b845 b485 )
    ( on b343 b845 )
    ( clear b343 )
  )
  ( :goal
    ( and
      ( clear b544 )
    )
  )
)
