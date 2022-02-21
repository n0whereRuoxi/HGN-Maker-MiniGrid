( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b306 - block
    b848 - block
    b855 - block
    b116 - block
    b109 - block
    b844 - block
    b804 - block
    b284 - block
    b356 - block
    b482 - block
    b355 - block
    b254 - block
    b177 - block
    b681 - block
    b71 - block
    b147 - block
    b653 - block
    b917 - block
    b465 - block
    b515 - block
    b524 - block
    b832 - block
    b987 - block
    b640 - block
    b47 - block
    b429 - block
    b791 - block
    b926 - block
    b555 - block
    b737 - block
    b11 - block
    b658 - block
    b130 - block
    b928 - block
    b916 - block
    b226 - block
    b569 - block
    b239 - block
    b415 - block
    b152 - block
    b351 - block
    b266 - block
    b35 - block
    b782 - block
    b151 - block
    b845 - block
    b22 - block
    b842 - block
    b236 - block
    b749 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b306 )
    ( on b848 b306 )
    ( on b855 b848 )
    ( on b116 b855 )
    ( on b109 b116 )
    ( on b844 b109 )
    ( on b804 b844 )
    ( on b284 b804 )
    ( on b356 b284 )
    ( on b482 b356 )
    ( on b355 b482 )
    ( on b254 b355 )
    ( on b177 b254 )
    ( on b681 b177 )
    ( on b71 b681 )
    ( on b147 b71 )
    ( on b653 b147 )
    ( on b917 b653 )
    ( on b465 b917 )
    ( on b515 b465 )
    ( on b524 b515 )
    ( on b832 b524 )
    ( on b987 b832 )
    ( on b640 b987 )
    ( on b47 b640 )
    ( on b429 b47 )
    ( on b791 b429 )
    ( on b926 b791 )
    ( on b555 b926 )
    ( on b737 b555 )
    ( on b11 b737 )
    ( on b658 b11 )
    ( on b130 b658 )
    ( on b928 b130 )
    ( on b916 b928 )
    ( on b226 b916 )
    ( on b569 b226 )
    ( on b239 b569 )
    ( on b415 b239 )
    ( on b152 b415 )
    ( on b351 b152 )
    ( on b266 b351 )
    ( on b35 b266 )
    ( on b782 b35 )
    ( on b151 b782 )
    ( on b845 b151 )
    ( on b22 b845 )
    ( on b842 b22 )
    ( on b236 b842 )
    ( on b749 b236 )
    ( clear b749 )
  )
  ( :goal
    ( and
      ( clear b306 )
    )
  )
)
