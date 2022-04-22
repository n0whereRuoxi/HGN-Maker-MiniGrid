( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b144 - block
    b400 - block
    b916 - block
    b591 - block
    b776 - block
    b881 - block
    b25 - block
    b724 - block
    b600 - block
    b208 - block
    b898 - block
    b148 - block
    b118 - block
    b355 - block
    b320 - block
    b323 - block
    b266 - block
    b614 - block
    b267 - block
    b706 - block
    b874 - block
    b423 - block
    b310 - block
    b703 - block
    b885 - block
    b848 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b144 )
    ( on b400 b144 )
    ( on b916 b400 )
    ( on b591 b916 )
    ( on b776 b591 )
    ( on b881 b776 )
    ( on b25 b881 )
    ( on b724 b25 )
    ( on b600 b724 )
    ( on b208 b600 )
    ( on b898 b208 )
    ( on b148 b898 )
    ( on b118 b148 )
    ( on b355 b118 )
    ( on b320 b355 )
    ( on b323 b320 )
    ( on b266 b323 )
    ( on b614 b266 )
    ( on b267 b614 )
    ( on b706 b267 )
    ( on b874 b706 )
    ( on b423 b874 )
    ( on b310 b423 )
    ( on b703 b310 )
    ( on b885 b703 )
    ( on b848 b885 )
    ( clear b848 )
  )
  ( :goal
    ( and
      ( clear b144 )
    )
  )
)
