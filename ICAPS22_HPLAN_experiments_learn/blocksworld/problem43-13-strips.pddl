( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b427 - block
    b980 - block
    b850 - block
    b508 - block
    b409 - block
    b943 - block
    b358 - block
    b722 - block
    b547 - block
    b687 - block
    b655 - block
    b831 - block
    b338 - block
    b887 - block
    b365 - block
    b310 - block
    b54 - block
    b906 - block
    b300 - block
    b187 - block
    b183 - block
    b941 - block
    b982 - block
    b259 - block
    b195 - block
    b302 - block
    b225 - block
    b529 - block
    b799 - block
    b610 - block
    b932 - block
    b181 - block
    b254 - block
    b370 - block
    b890 - block
    b988 - block
    b14 - block
    b546 - block
    b407 - block
    b227 - block
    b606 - block
    b847 - block
    b499 - block
    b846 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b427 )
    ( on b980 b427 )
    ( on b850 b980 )
    ( on b508 b850 )
    ( on b409 b508 )
    ( on b943 b409 )
    ( on b358 b943 )
    ( on b722 b358 )
    ( on b547 b722 )
    ( on b687 b547 )
    ( on b655 b687 )
    ( on b831 b655 )
    ( on b338 b831 )
    ( on b887 b338 )
    ( on b365 b887 )
    ( on b310 b365 )
    ( on b54 b310 )
    ( on b906 b54 )
    ( on b300 b906 )
    ( on b187 b300 )
    ( on b183 b187 )
    ( on b941 b183 )
    ( on b982 b941 )
    ( on b259 b982 )
    ( on b195 b259 )
    ( on b302 b195 )
    ( on b225 b302 )
    ( on b529 b225 )
    ( on b799 b529 )
    ( on b610 b799 )
    ( on b932 b610 )
    ( on b181 b932 )
    ( on b254 b181 )
    ( on b370 b254 )
    ( on b890 b370 )
    ( on b988 b890 )
    ( on b14 b988 )
    ( on b546 b14 )
    ( on b407 b546 )
    ( on b227 b407 )
    ( on b606 b227 )
    ( on b847 b606 )
    ( on b499 b847 )
    ( on b846 b499 )
    ( clear b846 )
  )
  ( :goal
    ( and
      ( clear b427 )
    )
  )
)
