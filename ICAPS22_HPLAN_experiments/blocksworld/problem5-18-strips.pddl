( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b961 - block
    b340 - block
    b115 - block
    b868 - block
    b997 - block
    b883 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b961 )
    ( on b340 b961 )
    ( on b115 b340 )
    ( on b868 b115 )
    ( on b997 b868 )
    ( on b883 b997 )
    ( clear b883 )
  )
  ( :goal
    ( and
      ( clear b961 )
      ( clear b961 )
      ( clear b961 )
      ( clear b961 )
      ( clear b961 )
      ( clear b961 )
    )
  )
)
