( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b232 - block
    b875 - block
    b243 - block
    b375 - block
    b529 - block
    b678 - block
    b956 - block
    b414 - block
    b890 - block
    b749 - block
    b225 - block
    b325 - block
    b588 - block
    b350 - block
    b39 - block
    b101 - block
    b218 - block
    b380 - block
    b459 - block
    b738 - block
    b149 - block
    b69 - block
    b851 - block
    b755 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b232 )
    ( on b875 b232 )
    ( on b243 b875 )
    ( on b375 b243 )
    ( on b529 b375 )
    ( on b678 b529 )
    ( on b956 b678 )
    ( on b414 b956 )
    ( on b890 b414 )
    ( on b749 b890 )
    ( on b225 b749 )
    ( on b325 b225 )
    ( on b588 b325 )
    ( on b350 b588 )
    ( on b39 b350 )
    ( on b101 b39 )
    ( on b218 b101 )
    ( on b380 b218 )
    ( on b459 b380 )
    ( on b738 b459 )
    ( on b149 b738 )
    ( on b69 b149 )
    ( on b851 b69 )
    ( on b755 b851 )
    ( clear b755 )
  )
  ( :tasks
    ( Make-23Pile b875 b243 b375 b529 b678 b956 b414 b890 b749 b225 b325 b588 b350 b39 b101 b218 b380 b459 b738 b149 b69 b851 b755 )
  )
)
