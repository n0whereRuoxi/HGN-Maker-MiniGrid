( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b476 - block
    b303 - block
    b613 - block
    b287 - block
    b862 - block
    b233 - block
    b315 - block
    b784 - block
    b854 - block
    b633 - block
    b403 - block
    b606 - block
    b638 - block
    b692 - block
    b428 - block
    b118 - block
    b41 - block
    b464 - block
    b806 - block
    b163 - block
    b973 - block
    b528 - block
    b257 - block
    b871 - block
    b305 - block
    b509 - block
    b108 - block
    b896 - block
    b705 - block
    b407 - block
    b703 - block
    b758 - block
    b726 - block
    b39 - block
    b938 - block
    b804 - block
    b112 - block
    b264 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b476 )
    ( on b303 b476 )
    ( on b613 b303 )
    ( on b287 b613 )
    ( on b862 b287 )
    ( on b233 b862 )
    ( on b315 b233 )
    ( on b784 b315 )
    ( on b854 b784 )
    ( on b633 b854 )
    ( on b403 b633 )
    ( on b606 b403 )
    ( on b638 b606 )
    ( on b692 b638 )
    ( on b428 b692 )
    ( on b118 b428 )
    ( on b41 b118 )
    ( on b464 b41 )
    ( on b806 b464 )
    ( on b163 b806 )
    ( on b973 b163 )
    ( on b528 b973 )
    ( on b257 b528 )
    ( on b871 b257 )
    ( on b305 b871 )
    ( on b509 b305 )
    ( on b108 b509 )
    ( on b896 b108 )
    ( on b705 b896 )
    ( on b407 b705 )
    ( on b703 b407 )
    ( on b758 b703 )
    ( on b726 b758 )
    ( on b39 b726 )
    ( on b938 b39 )
    ( on b804 b938 )
    ( on b112 b804 )
    ( on b264 b112 )
    ( clear b264 )
  )
  ( :goal
    ( and
      ( clear b476 )
    )
  )
)
