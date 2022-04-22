( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b545 - block
    b241 - block
    b24 - block
    b44 - block
    b697 - block
    b38 - block
    b590 - block
    b67 - block
    b77 - block
    b161 - block
    b937 - block
    b736 - block
    b267 - block
    b899 - block
    b507 - block
    b60 - block
    b488 - block
    b448 - block
    b82 - block
    b98 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b545 )
    ( on b241 b545 )
    ( on b24 b241 )
    ( on b44 b24 )
    ( on b697 b44 )
    ( on b38 b697 )
    ( on b590 b38 )
    ( on b67 b590 )
    ( on b77 b67 )
    ( on b161 b77 )
    ( on b937 b161 )
    ( on b736 b937 )
    ( on b267 b736 )
    ( on b899 b267 )
    ( on b507 b899 )
    ( on b60 b507 )
    ( on b488 b60 )
    ( on b448 b488 )
    ( on b82 b448 )
    ( on b98 b82 )
    ( clear b98 )
  )
  ( :goal
    ( and
      ( clear b545 )
    )
  )
)
