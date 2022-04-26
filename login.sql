DEFINE _EDITOR='gvim -c "set filetype=sql"'
SET LINESIZE 2000
SET PAGESIZE 1000
SET TIME OFF
SET TIMING ON
SET SQLPROMPT '&_CONNECT_IDENTIFIER > '

DEFINE GNAME = 'not connected'
COLUMN GLOBAL_NAME NEW_VALUE GNAME
SET TERMOUT OFF
select '[' || to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') || ']' || ' ' || replace(global_name,'.WORLD',null) || ' > ' global_name from global_name;
-- SELECT SYSDATE GLOBAL_NAME FROM DUAL;
SET TERMOUT ON
SET SQLPROMPT '&&GNAME'



ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
column TABLE_NAME       format a30
column INDEX_NAME       format a30
column OBJECT_NAME      format a30
column COLUMN_NAME      format a30
column DATA_TYPE        format a10
column OWNER            format a10
column SEGMENT_NAME     format a30
column OWNER            format a15
column SYNONYM_NAME     format a30
column TABLE_OWNER      format a30
column COMMENTS         format a60
column TEXT             format a99
column TRIGGERING_EVENT format a9
column LINE             format 999
column PROPERTY_NAME    format a30
column PROPERTY_VALUE   format a30
column DESCRIPTION      format a40
column TABLESPACE_NAME  format a30
column PARTITION_NAME   format a30
column PARTITION_POSITION heading PART_POS format 99 
column NUM_ROWS         format 99,999,999
column BLOCKS           format 99,999,999
column AVG_ROW_LEN      format 999,999
column INITIAL_EXTENT   format 9,999,999
column NEXT_EXTENT      format 9,999,999
column MAX_EXTENT       format 99,999,999,999
column QTD              format 999,999,999
column REFERENCED_NAME  format a25
column REFERENCED_OWNER format a15
column REFERENCED_TYPE  format a17
column TYPE             format a20
column DEPENDENCY_TYPE  format a7 truncate
column Plan             format a99
column USERNAME         format a20
column SCHEMANAME       format a20
column OSUSER           format a20

