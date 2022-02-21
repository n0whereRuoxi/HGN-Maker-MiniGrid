( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b840 - block
    b679 - block
    b596 - block
    b544 - block
    b663 - block
    b202 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b840 )
    ( on b679 b840 )
    ( on b596 b679 )
    ( on b544 b596 )
    ( on b663 b544 )
    ( on b202 b663 )
    ( clear b202 )
  )
  ( :goal
    ( and
      ( clear b840 )
    )
  )
)
