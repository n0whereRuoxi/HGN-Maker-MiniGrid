( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b708 - block
    b188 - block
    b249 - block
    b152 - block
    b630 - block
    b866 - block
    b914 - block
    b811 - block
    b696 - block
    b15 - block
    b479 - block
    b100 - block
    b539 - block
    b592 - block
    b514 - block
    b846 - block
    b871 - block
    b141 - block
    b699 - block
    b585 - block
    b180 - block
    b255 - block
    b555 - block
    b573 - block
    b739 - block
    b966 - block
    b272 - block
    b609 - block
    b439 - block
    b151 - block
    b925 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b708 )
    ( on b188 b708 )
    ( on b249 b188 )
    ( on b152 b249 )
    ( on b630 b152 )
    ( on b866 b630 )
    ( on b914 b866 )
    ( on b811 b914 )
    ( on b696 b811 )
    ( on b15 b696 )
    ( on b479 b15 )
    ( on b100 b479 )
    ( on b539 b100 )
    ( on b592 b539 )
    ( on b514 b592 )
    ( on b846 b514 )
    ( on b871 b846 )
    ( on b141 b871 )
    ( on b699 b141 )
    ( on b585 b699 )
    ( on b180 b585 )
    ( on b255 b180 )
    ( on b555 b255 )
    ( on b573 b555 )
    ( on b739 b573 )
    ( on b966 b739 )
    ( on b272 b966 )
    ( on b609 b272 )
    ( on b439 b609 )
    ( on b151 b439 )
    ( on b925 b151 )
    ( clear b925 )
  )
  ( :tasks
    ( Make-30Pile b188 b249 b152 b630 b866 b914 b811 b696 b15 b479 b100 b539 b592 b514 b846 b871 b141 b699 b585 b180 b255 b555 b573 b739 b966 b272 b609 b439 b151 b925 )
  )
)
