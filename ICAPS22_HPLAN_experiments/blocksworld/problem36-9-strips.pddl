( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b136 - block
    b497 - block
    b182 - block
    b405 - block
    b218 - block
    b849 - block
    b827 - block
    b109 - block
    b778 - block
    b220 - block
    b651 - block
    b680 - block
    b897 - block
    b744 - block
    b312 - block
    b367 - block
    b76 - block
    b767 - block
    b365 - block
    b242 - block
    b882 - block
    b887 - block
    b760 - block
    b287 - block
    b591 - block
    b681 - block
    b963 - block
    b752 - block
    b913 - block
    b571 - block
    b86 - block
    b270 - block
    b443 - block
    b90 - block
    b618 - block
    b447 - block
    b829 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b136 )
    ( on b497 b136 )
    ( on b182 b497 )
    ( on b405 b182 )
    ( on b218 b405 )
    ( on b849 b218 )
    ( on b827 b849 )
    ( on b109 b827 )
    ( on b778 b109 )
    ( on b220 b778 )
    ( on b651 b220 )
    ( on b680 b651 )
    ( on b897 b680 )
    ( on b744 b897 )
    ( on b312 b744 )
    ( on b367 b312 )
    ( on b76 b367 )
    ( on b767 b76 )
    ( on b365 b767 )
    ( on b242 b365 )
    ( on b882 b242 )
    ( on b887 b882 )
    ( on b760 b887 )
    ( on b287 b760 )
    ( on b591 b287 )
    ( on b681 b591 )
    ( on b963 b681 )
    ( on b752 b963 )
    ( on b913 b752 )
    ( on b571 b913 )
    ( on b86 b571 )
    ( on b270 b86 )
    ( on b443 b270 )
    ( on b90 b443 )
    ( on b618 b90 )
    ( on b447 b618 )
    ( on b829 b447 )
    ( clear b829 )
  )
  ( :goal
    ( and
      ( clear b136 )
    )
  )
)
