( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b891 - block
    b929 - block
    b857 - block
    b394 - block
    b287 - block
    b2 - block
    b466 - block
    b137 - block
    b330 - block
    b391 - block
    b652 - block
    b75 - block
    b871 - block
    b495 - block
    b210 - block
    b966 - block
    b371 - block
    b749 - block
    b465 - block
    b21 - block
    b143 - block
    b628 - block
    b246 - block
    b546 - block
    b380 - block
    b446 - block
    b301 - block
    b895 - block
    b275 - block
    b543 - block
    b892 - block
    b248 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b891 )
    ( on b929 b891 )
    ( on b857 b929 )
    ( on b394 b857 )
    ( on b287 b394 )
    ( on b2 b287 )
    ( on b466 b2 )
    ( on b137 b466 )
    ( on b330 b137 )
    ( on b391 b330 )
    ( on b652 b391 )
    ( on b75 b652 )
    ( on b871 b75 )
    ( on b495 b871 )
    ( on b210 b495 )
    ( on b966 b210 )
    ( on b371 b966 )
    ( on b749 b371 )
    ( on b465 b749 )
    ( on b21 b465 )
    ( on b143 b21 )
    ( on b628 b143 )
    ( on b246 b628 )
    ( on b546 b246 )
    ( on b380 b546 )
    ( on b446 b380 )
    ( on b301 b446 )
    ( on b895 b301 )
    ( on b275 b895 )
    ( on b543 b275 )
    ( on b892 b543 )
    ( on b248 b892 )
    ( clear b248 )
  )
  ( :goal
    ( and
      ( clear b891 )
    )
  )
)
