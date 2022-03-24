( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b293 - block
    b962 - block
    b807 - block
    b862 - block
    b127 - block
    b302 - block
    b628 - block
    b93 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b293 )
    ( on b962 b293 )
    ( on b807 b962 )
    ( on b862 b807 )
    ( on b127 b862 )
    ( on b302 b127 )
    ( on b628 b302 )
    ( on b93 b628 )
    ( clear b93 )
  )
  ( :goal
    ( and
      ( clear b293 )
    )
  )
)
