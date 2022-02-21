( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b677 - block
    b278 - block
    b344 - block
    b801 - block
    b719 - block
    b328 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b677 )
    ( on b278 b677 )
    ( on b344 b278 )
    ( on b801 b344 )
    ( on b719 b801 )
    ( on b328 b719 )
    ( clear b328 )
  )
  ( :goal
    ( and
      ( clear b677 )
      ( clear b677 )
      ( clear b677 )
      ( clear b677 )
      ( clear b677 )
      ( clear b677 )
    )
  )
)
