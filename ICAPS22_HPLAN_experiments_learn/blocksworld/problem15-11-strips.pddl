( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b965 - block
    b838 - block
    b389 - block
    b122 - block
    b103 - block
    b536 - block
    b665 - block
    b75 - block
    b692 - block
    b524 - block
    b951 - block
    b590 - block
    b844 - block
    b942 - block
    b278 - block
    b163 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b965 )
    ( on b838 b965 )
    ( on b389 b838 )
    ( on b122 b389 )
    ( on b103 b122 )
    ( on b536 b103 )
    ( on b665 b536 )
    ( on b75 b665 )
    ( on b692 b75 )
    ( on b524 b692 )
    ( on b951 b524 )
    ( on b590 b951 )
    ( on b844 b590 )
    ( on b942 b844 )
    ( on b278 b942 )
    ( on b163 b278 )
    ( clear b163 )
  )
  ( :goal
    ( and
      ( clear b965 )
    )
  )
)
