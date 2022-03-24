( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b939 - block
    b797 - block
    b15 - block
    b753 - block
    b182 - block
    b949 - block
    b818 - block
    b304 - block
    b758 - block
    b670 - block
    b31 - block
    b195 - block
    b557 - block
    b503 - block
    b679 - block
    b474 - block
    b577 - block
    b246 - block
    b591 - block
    b408 - block
    b780 - block
    b433 - block
    b44 - block
    b891 - block
    b572 - block
    b678 - block
    b192 - block
    b488 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b939 )
    ( on b797 b939 )
    ( on b15 b797 )
    ( on b753 b15 )
    ( on b182 b753 )
    ( on b949 b182 )
    ( on b818 b949 )
    ( on b304 b818 )
    ( on b758 b304 )
    ( on b670 b758 )
    ( on b31 b670 )
    ( on b195 b31 )
    ( on b557 b195 )
    ( on b503 b557 )
    ( on b679 b503 )
    ( on b474 b679 )
    ( on b577 b474 )
    ( on b246 b577 )
    ( on b591 b246 )
    ( on b408 b591 )
    ( on b780 b408 )
    ( on b433 b780 )
    ( on b44 b433 )
    ( on b891 b44 )
    ( on b572 b891 )
    ( on b678 b572 )
    ( on b192 b678 )
    ( on b488 b192 )
    ( clear b488 )
  )
  ( :tasks
    ( Make-27Pile b797 b15 b753 b182 b949 b818 b304 b758 b670 b31 b195 b557 b503 b679 b474 b577 b246 b591 b408 b780 b433 b44 b891 b572 b678 b192 b488 )
  )
)
