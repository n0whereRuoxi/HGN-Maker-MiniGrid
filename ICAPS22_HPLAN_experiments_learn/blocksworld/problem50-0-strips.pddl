( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b251 - block
    b628 - block
    b604 - block
    b39 - block
    b94 - block
    b349 - block
    b48 - block
    b866 - block
    b932 - block
    b328 - block
    b772 - block
    b35 - block
    b294 - block
    b333 - block
    b364 - block
    b988 - block
    b560 - block
    b931 - block
    b508 - block
    b71 - block
    b229 - block
    b453 - block
    b857 - block
    b615 - block
    b759 - block
    b737 - block
    b391 - block
    b682 - block
    b241 - block
    b955 - block
    b853 - block
    b357 - block
    b252 - block
    b700 - block
    b62 - block
    b878 - block
    b383 - block
    b425 - block
    b624 - block
    b683 - block
    b221 - block
    b607 - block
    b855 - block
    b345 - block
    b126 - block
    b518 - block
    b613 - block
    b149 - block
    b812 - block
    b427 - block
    b264 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b251 )
    ( on b628 b251 )
    ( on b604 b628 )
    ( on b39 b604 )
    ( on b94 b39 )
    ( on b349 b94 )
    ( on b48 b349 )
    ( on b866 b48 )
    ( on b932 b866 )
    ( on b328 b932 )
    ( on b772 b328 )
    ( on b35 b772 )
    ( on b294 b35 )
    ( on b333 b294 )
    ( on b364 b333 )
    ( on b988 b364 )
    ( on b560 b988 )
    ( on b931 b560 )
    ( on b508 b931 )
    ( on b71 b508 )
    ( on b229 b71 )
    ( on b453 b229 )
    ( on b857 b453 )
    ( on b615 b857 )
    ( on b759 b615 )
    ( on b737 b759 )
    ( on b391 b737 )
    ( on b682 b391 )
    ( on b241 b682 )
    ( on b955 b241 )
    ( on b853 b955 )
    ( on b357 b853 )
    ( on b252 b357 )
    ( on b700 b252 )
    ( on b62 b700 )
    ( on b878 b62 )
    ( on b383 b878 )
    ( on b425 b383 )
    ( on b624 b425 )
    ( on b683 b624 )
    ( on b221 b683 )
    ( on b607 b221 )
    ( on b855 b607 )
    ( on b345 b855 )
    ( on b126 b345 )
    ( on b518 b126 )
    ( on b613 b518 )
    ( on b149 b613 )
    ( on b812 b149 )
    ( on b427 b812 )
    ( on b264 b427 )
    ( clear b264 )
  )
  ( :goal
    ( and
      ( clear b251 )
    )
  )
)
