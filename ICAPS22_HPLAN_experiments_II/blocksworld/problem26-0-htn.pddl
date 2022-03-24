( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b798 - block
    b869 - block
    b52 - block
    b42 - block
    b437 - block
    b228 - block
    b109 - block
    b791 - block
    b943 - block
    b183 - block
    b818 - block
    b298 - block
    b743 - block
    b318 - block
    b679 - block
    b534 - block
    b397 - block
    b993 - block
    b895 - block
    b894 - block
    b655 - block
    b766 - block
    b814 - block
    b488 - block
    b540 - block
    b811 - block
    b212 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b798 )
    ( on b869 b798 )
    ( on b52 b869 )
    ( on b42 b52 )
    ( on b437 b42 )
    ( on b228 b437 )
    ( on b109 b228 )
    ( on b791 b109 )
    ( on b943 b791 )
    ( on b183 b943 )
    ( on b818 b183 )
    ( on b298 b818 )
    ( on b743 b298 )
    ( on b318 b743 )
    ( on b679 b318 )
    ( on b534 b679 )
    ( on b397 b534 )
    ( on b993 b397 )
    ( on b895 b993 )
    ( on b894 b895 )
    ( on b655 b894 )
    ( on b766 b655 )
    ( on b814 b766 )
    ( on b488 b814 )
    ( on b540 b488 )
    ( on b811 b540 )
    ( on b212 b811 )
    ( clear b212 )
  )
  ( :tasks
    ( Make-26Pile b869 b52 b42 b437 b228 b109 b791 b943 b183 b818 b298 b743 b318 b679 b534 b397 b993 b895 b894 b655 b766 b814 b488 b540 b811 b212 )
  )
)
