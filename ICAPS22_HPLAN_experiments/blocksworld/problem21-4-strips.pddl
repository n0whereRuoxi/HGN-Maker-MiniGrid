( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b674 - block
    b872 - block
    b156 - block
    b709 - block
    b170 - block
    b826 - block
    b2 - block
    b272 - block
    b721 - block
    b152 - block
    b765 - block
    b698 - block
    b584 - block
    b673 - block
    b81 - block
    b907 - block
    b429 - block
    b44 - block
    b268 - block
    b832 - block
    b336 - block
    b219 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b674 )
    ( on b872 b674 )
    ( on b156 b872 )
    ( on b709 b156 )
    ( on b170 b709 )
    ( on b826 b170 )
    ( on b2 b826 )
    ( on b272 b2 )
    ( on b721 b272 )
    ( on b152 b721 )
    ( on b765 b152 )
    ( on b698 b765 )
    ( on b584 b698 )
    ( on b673 b584 )
    ( on b81 b673 )
    ( on b907 b81 )
    ( on b429 b907 )
    ( on b44 b429 )
    ( on b268 b44 )
    ( on b832 b268 )
    ( on b336 b832 )
    ( on b219 b336 )
    ( clear b219 )
  )
  ( :goal
    ( and
      ( clear b674 )
    )
  )
)
