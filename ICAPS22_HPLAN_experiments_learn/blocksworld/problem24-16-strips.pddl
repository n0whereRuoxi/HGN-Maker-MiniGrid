( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b588 - block
    b844 - block
    b994 - block
    b253 - block
    b875 - block
    b395 - block
    b138 - block
    b11 - block
    b561 - block
    b748 - block
    b71 - block
    b754 - block
    b765 - block
    b827 - block
    b684 - block
    b743 - block
    b948 - block
    b571 - block
    b98 - block
    b969 - block
    b289 - block
    b719 - block
    b388 - block
    b877 - block
    b360 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b588 )
    ( on b844 b588 )
    ( on b994 b844 )
    ( on b253 b994 )
    ( on b875 b253 )
    ( on b395 b875 )
    ( on b138 b395 )
    ( on b11 b138 )
    ( on b561 b11 )
    ( on b748 b561 )
    ( on b71 b748 )
    ( on b754 b71 )
    ( on b765 b754 )
    ( on b827 b765 )
    ( on b684 b827 )
    ( on b743 b684 )
    ( on b948 b743 )
    ( on b571 b948 )
    ( on b98 b571 )
    ( on b969 b98 )
    ( on b289 b969 )
    ( on b719 b289 )
    ( on b388 b719 )
    ( on b877 b388 )
    ( on b360 b877 )
    ( clear b360 )
  )
  ( :goal
    ( and
      ( clear b588 )
    )
  )
)
