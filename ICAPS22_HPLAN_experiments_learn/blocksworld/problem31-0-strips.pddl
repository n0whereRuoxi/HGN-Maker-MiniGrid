( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b432 - block
    b664 - block
    b640 - block
    b27 - block
    b168 - block
    b767 - block
    b316 - block
    b292 - block
    b635 - block
    b645 - block
    b229 - block
    b857 - block
    b370 - block
    b986 - block
    b345 - block
    b131 - block
    b726 - block
    b48 - block
    b144 - block
    b314 - block
    b572 - block
    b883 - block
    b781 - block
    b721 - block
    b507 - block
    b971 - block
    b296 - block
    b567 - block
    b402 - block
    b611 - block
    b423 - block
    b723 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b432 )
    ( on b664 b432 )
    ( on b640 b664 )
    ( on b27 b640 )
    ( on b168 b27 )
    ( on b767 b168 )
    ( on b316 b767 )
    ( on b292 b316 )
    ( on b635 b292 )
    ( on b645 b635 )
    ( on b229 b645 )
    ( on b857 b229 )
    ( on b370 b857 )
    ( on b986 b370 )
    ( on b345 b986 )
    ( on b131 b345 )
    ( on b726 b131 )
    ( on b48 b726 )
    ( on b144 b48 )
    ( on b314 b144 )
    ( on b572 b314 )
    ( on b883 b572 )
    ( on b781 b883 )
    ( on b721 b781 )
    ( on b507 b721 )
    ( on b971 b507 )
    ( on b296 b971 )
    ( on b567 b296 )
    ( on b402 b567 )
    ( on b611 b402 )
    ( on b423 b611 )
    ( on b723 b423 )
    ( clear b723 )
  )
  ( :goal
    ( and
      ( clear b432 )
    )
  )
)
