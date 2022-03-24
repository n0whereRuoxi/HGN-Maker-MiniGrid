( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b640 - block
    b542 - block
    b253 - block
    b635 - block
    b321 - block
    b119 - block
    b765 - block
    b212 - block
    b539 - block
    b154 - block
    b302 - block
    b234 - block
    b767 - block
    b785 - block
    b897 - block
    b466 - block
    b379 - block
    b280 - block
    b974 - block
    b826 - block
    b673 - block
    b503 - block
    b146 - block
    b973 - block
    b90 - block
    b528 - block
    b409 - block
    b479 - block
    b256 - block
    b914 - block
    b165 - block
    b314 - block
    b705 - block
    b829 - block
    b930 - block
    b270 - block
    b976 - block
    b550 - block
    b749 - block
    b727 - block
    b518 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b640 )
    ( on b542 b640 )
    ( on b253 b542 )
    ( on b635 b253 )
    ( on b321 b635 )
    ( on b119 b321 )
    ( on b765 b119 )
    ( on b212 b765 )
    ( on b539 b212 )
    ( on b154 b539 )
    ( on b302 b154 )
    ( on b234 b302 )
    ( on b767 b234 )
    ( on b785 b767 )
    ( on b897 b785 )
    ( on b466 b897 )
    ( on b379 b466 )
    ( on b280 b379 )
    ( on b974 b280 )
    ( on b826 b974 )
    ( on b673 b826 )
    ( on b503 b673 )
    ( on b146 b503 )
    ( on b973 b146 )
    ( on b90 b973 )
    ( on b528 b90 )
    ( on b409 b528 )
    ( on b479 b409 )
    ( on b256 b479 )
    ( on b914 b256 )
    ( on b165 b914 )
    ( on b314 b165 )
    ( on b705 b314 )
    ( on b829 b705 )
    ( on b930 b829 )
    ( on b270 b930 )
    ( on b976 b270 )
    ( on b550 b976 )
    ( on b749 b550 )
    ( on b727 b749 )
    ( on b518 b727 )
    ( clear b518 )
  )
  ( :tasks
    ( Make-40Pile b542 b253 b635 b321 b119 b765 b212 b539 b154 b302 b234 b767 b785 b897 b466 b379 b280 b974 b826 b673 b503 b146 b973 b90 b528 b409 b479 b256 b914 b165 b314 b705 b829 b930 b270 b976 b550 b749 b727 b518 )
  )
)
