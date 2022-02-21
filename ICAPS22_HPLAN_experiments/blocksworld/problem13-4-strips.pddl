( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b78 - block
    b475 - block
    b841 - block
    b833 - block
    b232 - block
    b850 - block
    b893 - block
    b961 - block
    b531 - block
    b685 - block
    b931 - block
    b48 - block
    b73 - block
    b858 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b78 )
    ( on b475 b78 )
    ( on b841 b475 )
    ( on b833 b841 )
    ( on b232 b833 )
    ( on b850 b232 )
    ( on b893 b850 )
    ( on b961 b893 )
    ( on b531 b961 )
    ( on b685 b531 )
    ( on b931 b685 )
    ( on b48 b931 )
    ( on b73 b48 )
    ( on b858 b73 )
    ( clear b858 )
  )
  ( :goal
    ( and
      ( clear b78 )
    )
  )
)
