( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b254 - block
    b182 - block
    b883 - block
    b660 - block
    b258 - block
    b261 - block
    b292 - block
    b932 - block
    b242 - block
    b665 - block
    b858 - block
    b101 - block
    b890 - block
    b207 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b254 )
    ( on b182 b254 )
    ( on b883 b182 )
    ( on b660 b883 )
    ( on b258 b660 )
    ( on b261 b258 )
    ( on b292 b261 )
    ( on b932 b292 )
    ( on b242 b932 )
    ( on b665 b242 )
    ( on b858 b665 )
    ( on b101 b858 )
    ( on b890 b101 )
    ( on b207 b890 )
    ( clear b207 )
  )
  ( :tasks
    ( Make-13Pile b182 b883 b660 b258 b261 b292 b932 b242 b665 b858 b101 b890 b207 )
  )
)
