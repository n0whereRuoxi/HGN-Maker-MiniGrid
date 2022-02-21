( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b93 - block
    b898 - block
    b625 - block
    b686 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b93 )
    ( on b898 b93 )
    ( on b625 b898 )
    ( on b686 b625 )
    ( clear b686 )
  )
  ( :goal
    ( and
      ( clear b93 )
      ( clear b93 )
      ( clear b93 )
      ( clear b93 )
    )
  )
)
