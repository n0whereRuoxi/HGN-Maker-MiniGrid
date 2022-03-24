( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b394 - block
    b937 - block
    b452 - block
    b792 - block
    b74 - block
    b403 - block
    b691 - block
    b301 - block
    b652 - block
    b81 - block
    b108 - block
    b163 - block
    b66 - block
    b785 - block
    b974 - block
    b917 - block
    b39 - block
    b818 - block
    b274 - block
    b131 - block
    b921 - block
    b19 - block
    b906 - block
    b803 - block
    b663 - block
    b695 - block
    b577 - block
    b879 - block
    b628 - block
    b620 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b394 )
    ( on b937 b394 )
    ( on b452 b937 )
    ( on b792 b452 )
    ( on b74 b792 )
    ( on b403 b74 )
    ( on b691 b403 )
    ( on b301 b691 )
    ( on b652 b301 )
    ( on b81 b652 )
    ( on b108 b81 )
    ( on b163 b108 )
    ( on b66 b163 )
    ( on b785 b66 )
    ( on b974 b785 )
    ( on b917 b974 )
    ( on b39 b917 )
    ( on b818 b39 )
    ( on b274 b818 )
    ( on b131 b274 )
    ( on b921 b131 )
    ( on b19 b921 )
    ( on b906 b19 )
    ( on b803 b906 )
    ( on b663 b803 )
    ( on b695 b663 )
    ( on b577 b695 )
    ( on b879 b577 )
    ( on b628 b879 )
    ( on b620 b628 )
    ( clear b620 )
  )
  ( :goal
    ( and
      ( clear b394 )
    )
  )
)
