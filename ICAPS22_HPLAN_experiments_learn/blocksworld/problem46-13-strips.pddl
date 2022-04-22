( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b471 - block
    b352 - block
    b892 - block
    b201 - block
    b343 - block
    b698 - block
    b963 - block
    b46 - block
    b365 - block
    b89 - block
    b889 - block
    b152 - block
    b354 - block
    b98 - block
    b795 - block
    b860 - block
    b759 - block
    b924 - block
    b380 - block
    b796 - block
    b637 - block
    b727 - block
    b375 - block
    b370 - block
    b930 - block
    b348 - block
    b915 - block
    b412 - block
    b326 - block
    b797 - block
    b424 - block
    b725 - block
    b417 - block
    b545 - block
    b160 - block
    b284 - block
    b646 - block
    b735 - block
    b831 - block
    b453 - block
    b405 - block
    b914 - block
    b714 - block
    b285 - block
    b80 - block
    b218 - block
    b794 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b471 )
    ( on b352 b471 )
    ( on b892 b352 )
    ( on b201 b892 )
    ( on b343 b201 )
    ( on b698 b343 )
    ( on b963 b698 )
    ( on b46 b963 )
    ( on b365 b46 )
    ( on b89 b365 )
    ( on b889 b89 )
    ( on b152 b889 )
    ( on b354 b152 )
    ( on b98 b354 )
    ( on b795 b98 )
    ( on b860 b795 )
    ( on b759 b860 )
    ( on b924 b759 )
    ( on b380 b924 )
    ( on b796 b380 )
    ( on b637 b796 )
    ( on b727 b637 )
    ( on b375 b727 )
    ( on b370 b375 )
    ( on b930 b370 )
    ( on b348 b930 )
    ( on b915 b348 )
    ( on b412 b915 )
    ( on b326 b412 )
    ( on b797 b326 )
    ( on b424 b797 )
    ( on b725 b424 )
    ( on b417 b725 )
    ( on b545 b417 )
    ( on b160 b545 )
    ( on b284 b160 )
    ( on b646 b284 )
    ( on b735 b646 )
    ( on b831 b735 )
    ( on b453 b831 )
    ( on b405 b453 )
    ( on b914 b405 )
    ( on b714 b914 )
    ( on b285 b714 )
    ( on b80 b285 )
    ( on b218 b80 )
    ( on b794 b218 )
    ( clear b794 )
  )
  ( :goal
    ( and
      ( clear b471 )
    )
  )
)
