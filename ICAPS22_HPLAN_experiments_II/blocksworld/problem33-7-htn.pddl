( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b499 - block
    b118 - block
    b531 - block
    b432 - block
    b979 - block
    b980 - block
    b1 - block
    b715 - block
    b590 - block
    b766 - block
    b670 - block
    b32 - block
    b169 - block
    b197 - block
    b602 - block
    b56 - block
    b23 - block
    b244 - block
    b528 - block
    b324 - block
    b592 - block
    b36 - block
    b246 - block
    b104 - block
    b585 - block
    b95 - block
    b774 - block
    b765 - block
    b539 - block
    b149 - block
    b822 - block
    b355 - block
    b673 - block
    b136 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b499 )
    ( on b118 b499 )
    ( on b531 b118 )
    ( on b432 b531 )
    ( on b979 b432 )
    ( on b980 b979 )
    ( on b1 b980 )
    ( on b715 b1 )
    ( on b590 b715 )
    ( on b766 b590 )
    ( on b670 b766 )
    ( on b32 b670 )
    ( on b169 b32 )
    ( on b197 b169 )
    ( on b602 b197 )
    ( on b56 b602 )
    ( on b23 b56 )
    ( on b244 b23 )
    ( on b528 b244 )
    ( on b324 b528 )
    ( on b592 b324 )
    ( on b36 b592 )
    ( on b246 b36 )
    ( on b104 b246 )
    ( on b585 b104 )
    ( on b95 b585 )
    ( on b774 b95 )
    ( on b765 b774 )
    ( on b539 b765 )
    ( on b149 b539 )
    ( on b822 b149 )
    ( on b355 b822 )
    ( on b673 b355 )
    ( on b136 b673 )
    ( clear b136 )
  )
  ( :tasks
    ( Make-33Pile b118 b531 b432 b979 b980 b1 b715 b590 b766 b670 b32 b169 b197 b602 b56 b23 b244 b528 b324 b592 b36 b246 b104 b585 b95 b774 b765 b539 b149 b822 b355 b673 b136 )
  )
)
