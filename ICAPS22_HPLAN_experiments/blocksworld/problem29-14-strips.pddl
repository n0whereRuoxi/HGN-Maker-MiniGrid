( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b23 - block
    b32 - block
    b426 - block
    b447 - block
    b770 - block
    b830 - block
    b567 - block
    b566 - block
    b769 - block
    b714 - block
    b304 - block
    b471 - block
    b234 - block
    b823 - block
    b100 - block
    b592 - block
    b55 - block
    b949 - block
    b579 - block
    b690 - block
    b623 - block
    b686 - block
    b782 - block
    b748 - block
    b146 - block
    b195 - block
    b144 - block
    b296 - block
    b119 - block
    b896 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b23 )
    ( on b32 b23 )
    ( on b426 b32 )
    ( on b447 b426 )
    ( on b770 b447 )
    ( on b830 b770 )
    ( on b567 b830 )
    ( on b566 b567 )
    ( on b769 b566 )
    ( on b714 b769 )
    ( on b304 b714 )
    ( on b471 b304 )
    ( on b234 b471 )
    ( on b823 b234 )
    ( on b100 b823 )
    ( on b592 b100 )
    ( on b55 b592 )
    ( on b949 b55 )
    ( on b579 b949 )
    ( on b690 b579 )
    ( on b623 b690 )
    ( on b686 b623 )
    ( on b782 b686 )
    ( on b748 b782 )
    ( on b146 b748 )
    ( on b195 b146 )
    ( on b144 b195 )
    ( on b296 b144 )
    ( on b119 b296 )
    ( on b896 b119 )
    ( clear b896 )
  )
  ( :goal
    ( and
      ( clear b23 )
    )
  )
)
