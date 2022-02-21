( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b469 - block
    b282 - block
    b211 - block
    b716 - block
    b788 - block
    b462 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b469 )
    ( on b282 b469 )
    ( on b211 b282 )
    ( on b716 b211 )
    ( on b788 b716 )
    ( on b462 b788 )
    ( clear b462 )
  )
  ( :goal
    ( and
      ( clear b469 )
      ( clear b469 )
      ( clear b469 )
      ( clear b469 )
      ( clear b469 )
      ( clear b469 )
    )
  )
)
