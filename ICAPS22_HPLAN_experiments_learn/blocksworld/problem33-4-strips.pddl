( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b242 - block
    b335 - block
    b182 - block
    b992 - block
    b548 - block
    b613 - block
    b178 - block
    b931 - block
    b709 - block
    b294 - block
    b929 - block
    b65 - block
    b551 - block
    b265 - block
    b102 - block
    b804 - block
    b337 - block
    b486 - block
    b160 - block
    b704 - block
    b755 - block
    b524 - block
    b169 - block
    b614 - block
    b769 - block
    b830 - block
    b829 - block
    b689 - block
    b576 - block
    b353 - block
    b622 - block
    b376 - block
    b766 - block
    b529 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b242 )
    ( on b335 b242 )
    ( on b182 b335 )
    ( on b992 b182 )
    ( on b548 b992 )
    ( on b613 b548 )
    ( on b178 b613 )
    ( on b931 b178 )
    ( on b709 b931 )
    ( on b294 b709 )
    ( on b929 b294 )
    ( on b65 b929 )
    ( on b551 b65 )
    ( on b265 b551 )
    ( on b102 b265 )
    ( on b804 b102 )
    ( on b337 b804 )
    ( on b486 b337 )
    ( on b160 b486 )
    ( on b704 b160 )
    ( on b755 b704 )
    ( on b524 b755 )
    ( on b169 b524 )
    ( on b614 b169 )
    ( on b769 b614 )
    ( on b830 b769 )
    ( on b829 b830 )
    ( on b689 b829 )
    ( on b576 b689 )
    ( on b353 b576 )
    ( on b622 b353 )
    ( on b376 b622 )
    ( on b766 b376 )
    ( on b529 b766 )
    ( clear b529 )
  )
  ( :goal
    ( and
      ( clear b242 )
    )
  )
)
