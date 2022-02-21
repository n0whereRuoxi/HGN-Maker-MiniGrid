( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b588 - block
    b164 - block
    b551 - block
    b950 - block
    b906 - block
    b298 - block
    b84 - block
    b822 - block
    b388 - block
    b358 - block
    b197 - block
    b158 - block
    b150 - block
    b633 - block
    b96 - block
    b553 - block
    b75 - block
    b914 - block
    b741 - block
    b712 - block
    b400 - block
    b713 - block
    b571 - block
    b814 - block
    b239 - block
    b52 - block
    b755 - block
    b512 - block
    b680 - block
    b317 - block
    b268 - block
    b893 - block
    b287 - block
    b545 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b588 )
    ( on b164 b588 )
    ( on b551 b164 )
    ( on b950 b551 )
    ( on b906 b950 )
    ( on b298 b906 )
    ( on b84 b298 )
    ( on b822 b84 )
    ( on b388 b822 )
    ( on b358 b388 )
    ( on b197 b358 )
    ( on b158 b197 )
    ( on b150 b158 )
    ( on b633 b150 )
    ( on b96 b633 )
    ( on b553 b96 )
    ( on b75 b553 )
    ( on b914 b75 )
    ( on b741 b914 )
    ( on b712 b741 )
    ( on b400 b712 )
    ( on b713 b400 )
    ( on b571 b713 )
    ( on b814 b571 )
    ( on b239 b814 )
    ( on b52 b239 )
    ( on b755 b52 )
    ( on b512 b755 )
    ( on b680 b512 )
    ( on b317 b680 )
    ( on b268 b317 )
    ( on b893 b268 )
    ( on b287 b893 )
    ( on b545 b287 )
    ( clear b545 )
  )
  ( :goal
    ( and
      ( clear b588 )
    )
  )
)
