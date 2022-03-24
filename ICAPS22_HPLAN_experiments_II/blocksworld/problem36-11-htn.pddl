( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b216 - block
    b860 - block
    b413 - block
    b513 - block
    b95 - block
    b222 - block
    b683 - block
    b574 - block
    b489 - block
    b538 - block
    b150 - block
    b406 - block
    b699 - block
    b889 - block
    b192 - block
    b210 - block
    b416 - block
    b245 - block
    b58 - block
    b753 - block
    b671 - block
    b746 - block
    b212 - block
    b676 - block
    b741 - block
    b777 - block
    b954 - block
    b982 - block
    b728 - block
    b31 - block
    b122 - block
    b895 - block
    b967 - block
    b213 - block
    b890 - block
    b202 - block
    b928 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b216 )
    ( on b860 b216 )
    ( on b413 b860 )
    ( on b513 b413 )
    ( on b95 b513 )
    ( on b222 b95 )
    ( on b683 b222 )
    ( on b574 b683 )
    ( on b489 b574 )
    ( on b538 b489 )
    ( on b150 b538 )
    ( on b406 b150 )
    ( on b699 b406 )
    ( on b889 b699 )
    ( on b192 b889 )
    ( on b210 b192 )
    ( on b416 b210 )
    ( on b245 b416 )
    ( on b58 b245 )
    ( on b753 b58 )
    ( on b671 b753 )
    ( on b746 b671 )
    ( on b212 b746 )
    ( on b676 b212 )
    ( on b741 b676 )
    ( on b777 b741 )
    ( on b954 b777 )
    ( on b982 b954 )
    ( on b728 b982 )
    ( on b31 b728 )
    ( on b122 b31 )
    ( on b895 b122 )
    ( on b967 b895 )
    ( on b213 b967 )
    ( on b890 b213 )
    ( on b202 b890 )
    ( on b928 b202 )
    ( clear b928 )
  )
  ( :tasks
    ( Make-36Pile b860 b413 b513 b95 b222 b683 b574 b489 b538 b150 b406 b699 b889 b192 b210 b416 b245 b58 b753 b671 b746 b212 b676 b741 b777 b954 b982 b728 b31 b122 b895 b967 b213 b890 b202 b928 )
  )
)
