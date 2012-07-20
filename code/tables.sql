create server mail foreign data wrapper multicorn
  options (
    wrapper 'multicorn.imapfdw.ImapFdw'
  );

create server git foreign data wrapper multicorn
  options (
    wrapper 'multicorn.gitfdw.GitFdw'
  );

drop foreign table mails;

create foreign table mails (
  "From" character varying,
  "To"   character varying,
  "Subject" character varying,
  "In-Reply-To" character varying,
  "date" date,
  "Message-ID" character varying,
  "type" character varying,
  "MIME-Version" character varying,
  "Content-Type" character varying,
  payload    bytea,
  flags character varying[]
) server mail options (
  host 'imap.googlemail.com',
  payload_column 'payload',
  flags_column 'flags',
  internaldate_column 'date',
  ssl 'True',
  folder 'Mailing lists/Postgres' 
);

create user mapping for myuser server mail options (
  login 'mylogin',
  password 'supersecretpassword'
);

CREATE FOREIGN TABLE git(
    author_name character varying,
    author_email character varying,
    message character varying,
    hash character varying,
    body character varying,
    date timestamp without time zone
)
SERVER git
OPTIONS (path '/home/ro/experiments/pgwork/src/python2.6');
