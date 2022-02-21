( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b54 - block
    b506 - block
    b620 - block
    b321 - block
    b914 - block
    b986 - block
    b515 - block
    b202 - block
    b596 - block
    b989 - block
    b389 - block
    b397 - block
    b6 - block
    b669 - block
    b671 - block
    b304 - block
    b116 - block
    b197 - block
    b780 - block
    b685 - block
    b105 - block
    b684 - block
    b863 - block
    b559 - block
    b591 - block
    b251 - block
    b504 - block
    b297 - block
    b928 - block
    b15 - block
    b118 - block
    b375 - block
    b880 - block
    b999 - block
    b484 - block
    b673 - block
    b478 - block
    b783 - block
    b436 - block
    b925 - block
    b46 - block
    b849 - block
    b74 - block
    b686 - block
    b332 - block
    b727 - block
    b325 - block
    b34 - block
    b182 - block
    b217 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b54 )
    ( on b506 b54 )
    ( on b620 b506 )
    ( on b321 b620 )
    ( on b914 b321 )
    ( on b986 b914 )
    ( on b515 b986 )
    ( on b202 b515 )
    ( on b596 b202 )
    ( on b989 b596 )
    ( on b389 b989 )
    ( on b397 b389 )
    ( on b6 b397 )
    ( on b669 b6 )
    ( on b671 b669 )
    ( on b304 b671 )
    ( on b116 b304 )
    ( on b197 b116 )
    ( on b780 b197 )
    ( on b685 b780 )
    ( on b105 b685 )
    ( on b684 b105 )
    ( on b863 b684 )
    ( on b559 b863 )
    ( on b591 b559 )
    ( on b251 b591 )
    ( on b504 b251 )
    ( on b297 b504 )
    ( on b928 b297 )
    ( on b15 b928 )
    ( on b118 b15 )
    ( on b375 b118 )
    ( on b880 b375 )
    ( on b999 b880 )
    ( on b484 b999 )
    ( on b673 b484 )
    ( on b478 b673 )
    ( on b783 b478 )
    ( on b436 b783 )
    ( on b925 b436 )
    ( on b46 b925 )
    ( on b849 b46 )
    ( on b74 b849 )
    ( on b686 b74 )
    ( on b332 b686 )
    ( on b727 b332 )
    ( on b325 b727 )
    ( on b34 b325 )
    ( on b182 b34 )
    ( on b217 b182 )
    ( clear b217 )
  )
  ( :goal
    ( and
      ( clear b54 )
    )
  )
)
